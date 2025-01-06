resource "aws_route53_zone" "test_raymund" {
  name = "raymund.site"
}

# resource "aws_route53_record" "root_a_record" {
#   zone_id = aws_route53_zone.test_raymund.zone_id
#   name    = aws_route53_zone.test_raymund.name
#   type    = "A"

#   alias {
#     name                   = "d124qv2epgrx40.cloudfront.net." #TODO: get data source
#     zone_id                = "Z2FDTNDATAQYW2"                #TODO: make this dynamic using data {} S3 hosted_zone_id
#     evaluate_target_health = false
#   }
# }

# # Record created from R53
# resource "aws_route53_record" "acm_validation_1" {
#   zone_id = aws_route53_zone.test_raymund.zone_id
#   name    = "_50a1ac40af32add0ea4adc3f13f03f8d.www.raymund.site"
#   type    = "CNAME"
#   ttl     = 300
#   records = ["_60df12cdd42f094208581a5b64aedd06.zfyfvmchrl.acm-validations.aws."]
# }
