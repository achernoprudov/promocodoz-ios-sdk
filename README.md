# promocodoz-ios-sdk
Promocodoz SDK for iOS
http://promocodoz.com/

To use SDK firstly you need to set your own config:

```
let config = PromocodozConfig(accountSid: yourAccountSid, secretToken: yourSecretToken)
Promocodoz.instance.config = config
```

When your config is ready you could to reserve promocode from server:

```
Promocodoz.instance.reserve(promocode: yourPromoCode) { (resultOrNil, error) in
    guard let result = resultOrNil else {
        // handle error
    }
    // handle result
}
```
