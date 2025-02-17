import python

class SensitiveString extends Expr {
  SensitiveString() {
    this.toString().matches("(?i).*password.*") or
    this.toString().matches("(?i).*secret.*") or
    this.toString().matches("(?i).*apikey.*")
  }
}

from SensitiveString s
select s, "🚨 Potential sensitive data detected!"
