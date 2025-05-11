# UPLC Debug
- Related Issue: https://github.com/aiken-lang/aiken/issues/1166
- [Source Code Validator: `src/order.ak`](uplc-debug/validators/order.ak)
- Validator built by Aiken version: `aiken v1.0.24-alpha+982eff4`
- ✅ UPLC Version success: `v1.0.3 (rev 3d77b5c378ce404cddd9a1f111906d72fd46fc83)`
- ❌ UPLC Version failed:  `v1.1.17 (rev c3a7fba28232341dd5b3e60854c99a6f2c2a6c77)`

## Predict Problem
From Asset
```typescript
pub type Asset {
  policy_id: PolicyId,
  asset_name: AssetName,
}

let asset = Asset {
  policy_id: #"29d222ce763455e3d7a09a665ce554f00ac89d2e99a1a83d267170c6",
  asset_name: #"4d494e",
}
```
I have two ways to serialize to CBOR format: 
  - Left: `d8799f581c29d222ce763455e3d7a09a665ce554f00ac89d2e99a1a83d267170c6434d494eff`
  - Right: `d87982581c29d222ce763455e3d7a09a665ce554f00ac89d2e99a1a83d267170c6434d494e`

I expect that `left == right`. However, there seems to be a discrepancy between the two serialized outputs. This could indicate a potential issue in the serialization logic or differences in how the two methods handle specific data structures.

## Running the Project

To run the project, execute the following command:

```bash
cargo update && cargo run
```

Example:
```
➜  uplc-debug git:(master) ✗ cargo run                
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.30s
     Running `/Users/dzung/minswap/uplc-debug/target/debug/uplc-debug`
evaluate result v1.1.3: true
evaluate result v1.1.17: false
```