variable "project_name" {
  description = "Nombre corto del proyecto, usado para nombrar recursos."
  type        = string
}

variable "environment" {
  description = "Ambiente de trabajo, por ejemplo dev o prod."
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR de la VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDRs de las subnets publicas."
  type        = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "CIDRs de las subnets privadas usadas por la aplicacion."
  type        = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "CIDRs de las subnets privadas usadas por la base de datos."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones usadas para distribuir las subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Define si las subnets privadas de aplicacion tienen salida a Internet mediante NAT Gateway."
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Tags comunes para los recursos."
  type        = map(string)
  default     = {}
}
