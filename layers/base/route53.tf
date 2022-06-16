resource "aws_route53_record" "be-tf-studiographene-xyz" {
  zone_id = data.terraform_remote_state.common.outputs.tf_sg_xyz_hosted_zone_id
  name    = ""
  type    = "A"


  alias {
    name                   = module.alb.alb_dns_name
    zone_id                = module.alb.alb_zone_id
    evaluate_target_health = true
  }

  depends_on = [
    module.alb
  ]
}
