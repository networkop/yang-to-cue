
1. Initialise a Go module and add the ygot package

```
go mod init yang.to.cue
go get github.com/openconfig/ygot/generator
```

2. Get a local copy of the required YANG models

```
git clone --depth=1 https://github.com/YangModels/yang.git
git clone https://github.com/openconfig/public openconfig
curl -o yang/arista.yang https://raw.githubusercontent.com/aristanetworks/yang/master/EOS-4.25.1F/release/openconfig/models/interfaces/arista-intf-augments.yang
```

3. Generate types with ygot

```
mkdir pkg

go run github.com/openconfig/ygot/generator \
-path=openconfig \
-generate_fakeroot \
-fakeroot_name=device \
-output_file=pkg/yang.go \
-compress_paths=false \
-exclude_modules=ietf-interfaces \
-include_descriptions=false \
-include_model_data=false \
-include_model_data=false \
-include_schema=false \
-package_name=yang \
-exclude_state \
openconfig/release/models/interfaces/openconfig-if-ip.yang \
yang/arista.yang
```

4. (Optional) Generate a JSON payload using ygot

```
go run main.go
```

This generates the `./go.json` file


5. Modify YGOT types for CUE

```
# replace 'path' tags with 'json'
sed -i -E 's/path:"(\S+)"/json:"\1"/' pkg/yang.go
# replace Go maps with slices
sed -i -E 's/map\[string\]\*(\S+)/\[\]\*\1/' pkg/yang.go
sed -i -E 's/map\[uint32\]\*(\S+)/\[\]\*\1/' pkg/yang.go
```

6. Init CUE modules

```
cue mod init yang.cue
```

7. Import Go types into CUE

```
cue get go yang.to.cue/pkg/...
```

The generated file is located in `cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue`

8. Make some of the fields optional

This is happens because struct fields with ENUM type are not pointers and, hence, marked as mandatory fields by cue during import.

```
sed -i -E 's/(^[^#]\S+)(:\s+#E)/\1\?\2/' cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue
```

9. Write some CUE based on the generated definitions

```
cat values.cue
```

10. Check the that values are correct by evaluating them

```
cue eval values.cue --out=json
```


11. Check and update the test device details

```
cat gnmi_tool.cue
```

12. Apply the configuration

```
cue apply
```