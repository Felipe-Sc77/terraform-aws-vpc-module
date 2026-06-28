# Terraform AWS VPC Module

Este modulo crea la red base de la solucion. Define una VPC, subnets publicas,
subnets privadas para aplicacion y subnets privadas para base de datos.

## Recursos creados

- VPC
- Subnets publicas
- Subnets privadas para aplicacion
- Subnets privadas para base de datos
- Internet Gateway
- Route table publica
- Asociaciones de subnets publicas
- Elastic IP para NAT, si NAT esta habilitado
- NAT Gateway opcional en la primera subnet publica
- Route table privada para aplicacion
- Ruta privada hacia NAT, si NAT esta habilitado
- Asociaciones de subnets privadas de aplicacion
- Route table privada para base de datos
- Asociaciones de subnets privadas de base de datos

Este modulo no crea Security Groups. Los Security Groups se definen en los
modulos que los necesitan: ALB, ASG/app y RDS.

## Decisiones de red

Las subnets publicas tienen una ruta `0.0.0.0/0` hacia el Internet Gateway.

Las subnets privadas de aplicacion pueden salir a Internet mediante un NAT
Gateway si `enable_nat_gateway = true`. Para mantener el modulo simple, se crea
un solo NAT Gateway en la primera subnet publica.

Las subnets privadas de base de datos no tienen ruta hacia Internet Gateway ni
hacia NAT Gateway. Quedan aisladas y solo deberian recibir trafico desde la capa
de aplicacion, usando Security Groups en los modulos correspondientes.

## Variables

- `project_name`: nombre corto del proyecto.
- `environment`: ambiente de trabajo.
- `vpc_cidr`: CIDR de la VPC.
- `public_subnet_cidrs`: CIDRs de las subnets publicas.
- `private_app_subnet_cidrs`: CIDRs de las subnets privadas de aplicacion.
- `private_db_subnet_cidrs`: CIDRs de las subnets privadas de base de datos.
- `availability_zones`: zonas donde se crean las subnets.
- `enable_nat_gateway`: habilita o deshabilita el NAT Gateway.
- `common_tags`: tags comunes para los recursos.

Las listas de subnets usan el mismo orden que `availability_zones`. Por ejemplo,
el primer CIDR publico se crea en la primera Availability Zone.

## Outputs

- `vpc_id`
- `vpc_cidr_block`
- `public_subnet_ids`
- `private_app_subnet_ids`
- `private_db_subnet_ids`
- `internet_gateway_id`
- `nat_gateway_id`
- `public_route_table_id`
- `private_app_route_table_id`
- `private_db_route_table_id`
