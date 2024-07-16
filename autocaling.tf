
module "ecs_cloudwatch_autoscaling" {
  source = "cloudposse/ecs-cloudwatch-autoscaling/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace             = "t360-api"
  stage                 = "staging"
  name                  = "t360-scaling"
  service_name          = module.ecs_service_wrk.name
  cluster_name          = module.ecs_cluster.name
  min_capacity          = 2
  max_capacity          = 10
  scale_up_adjustment   = 2
  scale_up_cooldown     = 60
  scale_down_adjustment = -1
  scale_down_cooldown   = 300
}