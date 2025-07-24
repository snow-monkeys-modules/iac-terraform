resource "civo_object_store" "snowmonkeysbackup" {
    name = "snowmonkeysbackup"
    max_size_gb = 500
    region = "LON1"
}

# If you create the bucket without credentials, you can read the credentials in this way
data "civo_object_store_credential" "snowmonkeysbackup" {
    id = civo_object_store.snowmonkeysbackup.access_key_id
}