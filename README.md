# Example CRA - Workspaces
![](https://i.imgur.com/9BI6b0m.png)
![](https://github.com/claudiohilario/lerna-workspaces-cra/blob/master/example_dev.gif)
## Folder Structure
- packages
  - app-one (CRA) - The app one, created by Create React App
  - app-two (CRA) - The app one, created by Create React App
  - shared - The shared components.
  
## Install and start

```
cd /lerna-example
npm install

npm run bootstrap

npm run app-one:start
npm run app-two:start
```

## Build
```
npm run app-one:build
npm run app-two:build
```

## Docker Example
```
docker-compose up --build --remove-orphans --detach appone
```

## craco.config.js

```js
const path = require("path");
const { getLoader, loaderByName } = require("@craco/craco");
const absolutePath = path.join(__dirname, "../shared");
module.exports = {
    webpack: {
        alias: {},
        plugins: [],
        configure: (webpackConfig, { env, paths }) => {
            const { isFound, match } = getLoader(
                webpackConfig,
                loaderByName("babel-loader")
            );
            if (isFound) {
                const include = Array.isArray(match.loader.include)
                    ? match.loader.include
                    : [match.loader.include];
                match.loader.include = include.concat[absolutePath];
            }
            return webpackConfig;
        }
    }
};
```
