# -----------------------------------------------------
# MongoDB Atlas Configuration
# -----------------------------------------------------
resource "mongodbatlas_project" "mongodbatlas_project" {
  name = var.projectName
  org_id                                           = data.mongodbatlas_roles_org_id.org_id.org_id
}

resource "mongodbatlas_cluster" "mongodbatlas_cluster" {
  project_id                  = mongodbatlas_project.mongodbatlas_project.id
  name                        = "${var.projectName}-cluster"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name = upper(replace(var.awsRegion, "-", "_"))
  provider_instance_size_name = "M0"
}

resource "mongodbatlas_project_ip_access_list" "mongodbatlas_project_ip_access_list" {
  project_id = mongodbatlas_project.mongodbatlas_project.id
  cidr_block = "0.0.0.0/0"
  comment    = "Allow access from anywhere"
}


resource "mongodbatlas_database_user" "mongodbatlas_database_user" {
  username           = var.projectName
  password           = random_password.db_password.result
  project_id         = mongodbatlas_project.mongodbatlas_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }

  scopes {
    name = mongodbatlas_cluster.mongodbatlas_cluster.name
    type = "CLUSTER"
  }
}
