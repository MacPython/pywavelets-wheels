# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function get_test_cmd {
    local extra_argv=${1:-$EXTRA_ARGV}
    echo "import sys; import pywt; \
        sys.exit(not pywt.test('full', \
        extra_argv=[${extra_argv}]))"
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c "$(get_test_cmd)"
}
