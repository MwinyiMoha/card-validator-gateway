gen:
	protoc \
	--proto_path=protos \
	--include_imports \
	--include_source_info \
	--descriptor_set_out=./gen/definitions.pb \
	protos/*.proto

pull-protos:
	git submodule update --recursive --remote

.PHONY: gen pull-protos