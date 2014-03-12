#!/usr/bin/env bash

uptime | awk -F, '{ print $(NF - 3), $(NF - 2), $(NF - 1), $NF }'
