#!/usr/bin/env bats

cleanUpLocalImage() {
    docker rmi --force andes2020/ubuntu:latest
}

@test "Ensure image is built successfully" {
  run docker run andes2020/ubuntu:latest
  echo "status = ${status}"
  echo "output = ${output}"

  [ "$status" -eq 0 ]
  [ "$output" == "hello-world" ]
}

@test "Ensure python is installed successfully" {
  run docker run -i \
      andes2020/ubuntu:latest /bin/bash <<-EOF
        python --version
EOF

  echo "status = ${status}"
  echo "output = ${output}"

  [ "$status" -eq 0 ]
  [ "$output" == "Python 3.6.9" ]
}

@test "Ensure kubectl client is installed successfully" {
  run docker run -i \
      andes2020/ubuntu:latest /bin/bash <<-EOF
        kubectl version --client=true
EOF

  echo "status = ${status}"
  echo "output = ${output}"

  [ "$status" -eq 0 ]
  [ $(echo $output | grep "Client Version: version.Info{Major" | wc -l) -eq 1 ]
}

@test "Ensure aws cli is installed successfully" {
  run docker run -i \
      andes2020/ubuntu:latest /bin/bash <<-EOF
        aws --version
EOF

  echo "status = ${status}"
  echo "output = ${output}"

  [ "$status" -eq 0 ]
  [ $(echo $output | grep "aws-cli/" | wc -l) -eq 1 ]
}