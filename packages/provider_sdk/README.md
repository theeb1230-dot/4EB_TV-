# provider_sdk

4BA-owned provider boundary.

Concrete providers live outside this package. The SDK:
- depends only on core_domain;
- declares capabilities explicitly;
- fails unknown provider policy closed;
- rejects duplicate provider IDs;
- keeps normal UI independent from provider brands;
- never treats Stream as implicit Download support.

Signed remote configuration/cryptographic verification is intentionally not implemented until the security primitive and platform compatibility are audited.
