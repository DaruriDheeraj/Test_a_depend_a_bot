import python

class HardcodedCredentialExpr extends Expr {
  HardcodedCredentialExpr() {
    this.getType().hasName("str") and
    this.(Literal).getValue().regexpMatch("(?i)(password|passwd|pwd|secret|token|apikey|api_key|auth|key|private|certificate|cred|jwt|bearer|access)[^\n]*[=:][^\n]*")
  }
}

from HardcodedCredentialExpr e
select e, "Potential hardcoded secret or credential detected. Review this value."
