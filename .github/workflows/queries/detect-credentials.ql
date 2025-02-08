import java

/**
 * This query searches for potentially sensitive strings such as API keys,
 * tokens, or credentials hardcoded in the code.
 */
class SensitiveString extends StringLiteral {
  SensitiveString() {
    // These are some patterns that could represent sensitive information
    this.getValue().matches(".*(api|token|password|key|secret|credential).*")
  }
}

from SensitiveString ss
select ss, ss.getValue()
