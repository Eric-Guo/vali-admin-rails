[![CircleCI](https://circleci.com/gh/Eric-Guo/vali-admin-rails.svg?style=svg)](https://circleci.com/gh/Eric-Guo/vali-admin-rails)

## Introduction

This project using the [Vali admin](https://pratikborsadiya.in/vali-admin/) as a frontend UI framework in a Rails 5.2 project (webpacker and stimulus enable).

PR welcome, but notice UI part should go to [Vali admin upsteam](https://github.com/pratikborsadiya/vali-admin/pulls) instead of here.

## Preinstall

```bash
brew install ruby
brew install node
brew install yarn
brew install postgresql
gem install bundler
echo 'gem: "--no-document"' >> ~/.gemrc
```

## Regenerate master.key (skip if you have)

```bash
rm config/credentials.yml.enc
bin/rails credentials:edit
# copy secret_key_base line and paste as new line as devise_secret_key
```

## Link the master.key (using above if you don't)

```bash
ln -s /Users/user_name/.ssh/harman_vendor_master.key config/master.key
```

## Development prepare

```bash
bin/setup
```

## Run test

```bash
bin/rake
```

## Start development

```bash
bin/rails s
```
