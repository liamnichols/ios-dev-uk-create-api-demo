# CreateAPI Demo - iOS Dev UK 2022

![Header](Images/Header.png)

A small Demo app that uses API entities and paths generated using [CreateAPI](https://github.com/CreateAPI/CreateAPI).

To regenerate the DemoAPI package, run the following command:

```bash
swift package --allow-writing-to-package-directory demo-api-generator
```

You can experiment with different configuration options by modifying [**create-api.yml**](./create-api.yml). Use the [Configuration Options](https://github.com/CreateAPI/CreateAPI/blob/main/Docs/ConfigOptions.md) documentation for reference.

To use `create-api` outside of a Swift Package Plugin, [install the tool manually](https://github.com/createapi/createapi#installation) and run the following command:

```bash
create-api generate schema.json --config create-api.yml --output DemoAPI --clean
```

## More Resources

- [CreateAPI](https://github.com/CreateAPI/CreateAPI)
- [OpenAPI Specification](https://swagger.io/specification)
- [Demo API](https://cookpad.github.io/global-mobile-hiring)
- [Get](https://github.com/kean/get)
- [Introducing CreateAPI](https://kean.blog/post/create-api)
- [Generating an API with CreateAPI](https://github.com/CreateAPI/CreateAPI/blob/main/Docs/Tutorial.md)

