# 脚本说明: 
#   为 npm 项目添加 husky、commitlint、commitizen 支持
#   用于为 git commit msg 格式化并校验
# https://github.com/typicode/husky
# https://github.com/conventional-changelog/commitlint
# https://github.com/commitizen/cz-cli
# [ 前提需要: npm 7 以上 & git init ]

npm install husky -D &&
npm set-script prepare "husky install" &&
npm run prepare &&

npm install --save-dev @commitlint/{config-conventional,cli} &&
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js &&
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"' &&

npx commitizen init cz-conventional-changelog --save-dev --save-exact &&
npx husky add .husky/prepare-commit-msg 'exec < /dev/tty && npx cz --hook || true'
