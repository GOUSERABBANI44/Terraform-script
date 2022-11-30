# Create subnet groups
resource "aws_db_subnet_group" "db-sub" {
subnet_ids = [aws_subnet.pvt-sub-1.id, aws_subnet.pvt-sub-2.id]
tags = {
        Name = "dbsubnet"
        }
}
# Create the data-base
resource "aws_db_instance" "data" {
 allocated_storage = "10"
        db_subnet_group_name = aws_db_subnet_group.db-sub.id
        db_name = "mydata"
        engine = "mysql"
        engine_version = "8.0.28"
    instance_class = "db.t2.micro"
    multi_az = "true"
    username = "admin"
    password = "admin1230"
    vpc_security_group_ids = ["${aws_security_group.db-sg.id}"]
    skip_final_snapshot = "true"

}

# Create the security groups
resource "aws_security_group" "db-sg" {
        vpc_id = aws_vpc.mvpc.id

  ingress {
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_groups = [aws_security_group.demo.id]
  }

    egress {
    from_port = 32768
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
  Name = "database-sg"
  }
}
