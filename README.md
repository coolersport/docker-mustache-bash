# docker-mustache-bash
A specific use case of batch processing mustache templates

#### Expectation

- All template files end with .yml
- Environment file (mustache data) starts with a dot, e.g. `.production.yml` for production environment

#### Execution

    docker run -v `pwd`:/data --rm -it coolersport/mustache-bash <<env-name-without-dot-and-extension>>
