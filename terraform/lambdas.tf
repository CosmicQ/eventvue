# Lambda Functions
resource "aws_lambda_function" "log_event_function" {
  function_name = "LogEventFunction"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "log_event_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "log_event_function.zip"

  source_code_hash = filebase64sha256("log_event_function.zip")
}

resource "aws_lambda_function" "lock_event_function" {
  function_name = "LockEventFunction"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lock_event_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "lock_event_function.zip"

  source_code_hash = filebase64sha256("lock_event_function.zip")
}

resource "aws_lambda_function" "unlock_event_function" {
  function_name = "UnlockEventFunction"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "unlock_event_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "unlock_event_function.zip"

  source_code_hash = filebase64sha

