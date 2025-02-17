import python

/**
 * Finds hardcoded sensitive data such as passwords, API keys, and tokens.
 */
class SensitiveAssignment extends AssignExpr {
  SensitiveAssignment() {
    exists(string keyword |
      keyword = /(api[_-]?key|secret|password|passwd|token|access[_-]?key|auth[_-]?token)/i |
      this.getLValue().toString().matches(keyword) or
      this.getRValue().toString().matches(/["'][A-Za-z0-9-_]{10,}["']/)
    )
  }
}

from SensitiveAssignment assign
select assign, "🚨 Possible hardcoded sensitive data found in " + assign.getLValue().toString()
