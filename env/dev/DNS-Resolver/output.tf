output "dns_resolver_id" {
  value = module.dns_private_resolver.resolver_id
}

output "dns_resolver_name" {
  value = module.dns_private_resolver.resolver_name
}

output "outbound_endpoint_id" {
  value = module.dns_private_resolver.outbound_endpoint_id
}

output "ruleset_id" {
  value = module.dns_private_resolver.ruleset_id
}

output "forwarding_rules" {
  value = module.dns_private_resolver.forwarding_rules
}

output "vnet_links" {
  description = "Virtual network links attached to DNS forwarding ruleset"
  value       = module.dns_private_resolver.vnet_links
}