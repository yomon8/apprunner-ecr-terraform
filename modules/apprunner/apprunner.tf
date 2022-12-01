resource "time_sleep" "wait_role_creation" {
  depends_on = [aws_iam_role.service_role]

  create_duration = "15s"
}

resource "aws_apprunner_service" "service" {
  service_name = var.service_name

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.service_role.arn
    }
    image_repository {
      image_configuration {
        port = var.port
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }

  depends_on = [time_sleep.wait_role_creation]
}
