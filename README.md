
1. Initialise a Go module and add the ygot package

```
go mod init yang.to.cue
go get github.com/openconfig/ygot/generator
```

2. Get a local copy of the required YANG models

```
git clone --depth=1 https://github.com/YangModels/yang.git
git clone https://github.com/openconfig/public openconfig
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
-package_name=yang \
-include_descriptions=false \
-include_model_data=false \
-include_model_data=false \
-include_schema=false \
-trim_enum_openconfig_prefix=true \
-shorten_enum_leaf_names=true \
-exclude_state \
openconfig/release/models/interfaces/openconfig-if-ip.yang
```

4. Replace Go maps with slices and path tags with json tags

```
sed -i -E 's/path:"(\S+)"/json:"\1"/' pkg/yang.go 
sed -i -E 's/map\[string\]\*(\S+)/\[\]\*\1/' pkg/yang.go
sed -i -E 's/map\[uint32\]\*(\S+)/\[\]\*\1/' pkg/yang.go
```

5. Init CUE modules

```
cue mod init yang.cue
```

6. Import Go types into CUE

```
cue get go yang.to.cue/pkg/...
```

The generated file is located in `cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue`

7. Make some of the fields optional

This is happens because struct fields with ENUM type are not pointers and, hence, marked as mandatory fields by cue during import.

```
sed -i -E 's/(^[^#]\S+)(:\s+#E)/\1\?\2/' cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue
```

8. Write some CUE based on the generated definitions

```
cat values.cue
```

9. Check the that values are correct by evaluating them

```
cue eval values.cue --out=json
```


10. Check and update the test device details

```
cat gnmi_tool.cue
```

11. Apply the configuration

```
cue apply
```