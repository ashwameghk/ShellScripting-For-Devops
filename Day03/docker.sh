#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl restart containerd
sudo systemctl restart docker

