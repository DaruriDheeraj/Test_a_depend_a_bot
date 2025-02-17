import python

/**
 * Detects hardcoded sensitive data (API keys, passwords, tokens).
 */
class SensitivePattern extends Regex {
  SensitivePattern() { this = /(?i)(apikey|secret|password|token|passwd)\s*[=:]\s*["\'][a-zA-Z0-9-_]+["\']/ }
}

from AssignExpr assign, string value
where assign.getRValue().toString() = value and value.matches(SensitivePattern())
select assign, "Possible hardcoded sensitive data: " + value
