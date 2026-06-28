output "vpc_id" {
  description = "ID de la VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR de la VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets publicas."
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "IDs de las subnets privadas de aplicacion."
  value       = aws_subnet.private_app[*].id
}

output "private_db_subnet_ids" {
  description = "IDs de las subnets privadas de base de datos."
  value       = aws_subnet.private_db[*].id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "ID del NAT Gateway, o null si no se crea."
  value       = var.enable_nat_gateway ? aws_nat_gateway.this[0].id : null
}

output "public_route_table_id" {
  description = "ID de la route table publica."
  value       = aws_route_table.public.id
}

output "private_app_route_table_id" {
  description = "ID de la route table privada de aplicacion."
  value       = aws_route_table.private_app.id
}

output "private_db_route_table_id" {
  description = "ID de la route table privada de base de datos."
  value       = aws_route_table.private_db.id
}
