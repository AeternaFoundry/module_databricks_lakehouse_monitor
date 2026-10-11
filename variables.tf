variable "lakehouse_monitors" {
  description = <<EOT
Map of lakehouse_monitors, attributes below
Required:
    - assets_dir
    - output_schema_name
    - table_name
Optional:
    - baseline_table_name
    - latest_monitor_failure_msg
    - skip_builtin_dashboard
    - slicing_exprs
    - warehouse_id
    - custom_metrics (block):
        - definition (required)
        - input_columns (required)
        - name (required)
        - output_data_type (required)
        - type (required)
    - data_classification_config (block):
        - enabled (optional)
    - inference_log (block):
        - granularities (required)
        - label_col (optional)
        - model_id_col (required)
        - prediction_col (required)
        - prediction_proba_col (optional)
        - problem_type (required)
        - timestamp_col (required)
    - notifications (block):
        - on_failure (optional, block):
            - email_addresses (optional)
        - on_new_classification_tag_detected (optional, block):
            - email_addresses (optional)
    - provider_config (block):
        - workspace_id (optional)
    - schedule (block):
        - quartz_cron_expression (required)
        - timezone_id (required)
    - snapshot (block):
    - time_series (block):
        - granularities (required)
        - timestamp_col (required)
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    assets_dir                 = string
    output_schema_name         = string
    table_name                 = string
    baseline_table_name        = optional(string)
    latest_monitor_failure_msg = optional(string)
    skip_builtin_dashboard     = optional(bool)
    slicing_exprs              = optional(list(string))
    warehouse_id               = optional(string)
    custom_metrics = optional(list(object({
      definition       = string
      input_columns    = list(string)
      name             = string
      output_data_type = string
      type             = string
    })))
    data_classification_config = optional(object({
      enabled = optional(bool)
    }))
    inference_log = optional(object({
      granularities        = list(string)
      label_col            = optional(string)
      model_id_col         = string
      prediction_col       = string
      prediction_proba_col = optional(string)
      problem_type         = string
      timestamp_col        = string
    }))
    notifications = optional(object({
      on_failure = optional(object({
        email_addresses = optional(list(string))
      }))
      on_new_classification_tag_detected = optional(object({
        email_addresses = optional(list(string))
      }))
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    schedule = optional(object({
      quartz_cron_expression = string
      timezone_id            = string
    }))
    snapshot = optional(object({
    }))
    time_series = optional(object({
      granularities = list(string)
      timestamp_col = string
    }))
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
}

