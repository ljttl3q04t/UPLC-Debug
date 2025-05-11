use aiken/transaction/value.{AssetName, PolicyId}

pub type Asset {
  policy_id: PolicyId,
  asset_name: AssetName,
}

pub type Datum {
  left: Asset,
  right: Asset,
}

validator {
  fn order(datum: Datum, _, __) {
    let Datum { left, right } = datum
    left == right
  }
}
