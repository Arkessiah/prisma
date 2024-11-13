#/bin/bash

set -ex

if [ "$RUNNER_OS" = "Windows" ]; then
    pwsh .github/workflows/scripts/install-mysql.ps1
fi

if [ "$RUNNER_OS" = "macOS" ]; then
    brew install mysql@8.4
    brew services run mysql
fi

echo 'TEST_MYSQL_URI=mysql://root@127.0.0.1:3306/tests' >> "$GITHUB_ENV"
echo 'TEST_FUNCTIONAL_MYSQL_URI=mysql://root@127.0.0.1:3306/PRISMA_DB_NAME' >> "$GITHUB_ENV"
echo 'TEST_MYSQL_URI_MIGRATE=mysql://root@127.0.0.1:3306/tests-migrate' >> "$GITHUB_ENV"
echo 'TEST_MYSQL_SHADOWDB_URI_MIGRATE=mysql://root@127.0.0.1:3306/tests-migrate-shadowdb' >> "$GITHUB_ENV"
