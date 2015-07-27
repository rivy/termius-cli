#!/usr/bin/env bats


@test "hosts help by arg" {
    run serverauditor hosts --help
    [ "$status" -eq 0 ]
}

@test "hosts help command" {
    run serverauditor help hosts
    [ "$status" -eq 0 ]
}

@test "List hosts in table format" {
    rm ~/.serverauditor.storage || true
    serverauditor host -L test --port 2022 --address 123.2.3.2 --username root --password password
    run serverauditor hosts
    [ "$status" -eq 0 ]
    ! [ -z $(cat ~/.serverauditor.storage) ]
}
