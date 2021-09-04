import { WriteStream, writeFileSync } from 'fs';
import { v4 } from 'node-uuid';

import { exec, spawn } from 'child_process';
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
@Injectable()
export class PlanificadorService {
  async getPlanPrueba(): Promise<any> {
    const cmd = 'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl problem.pddl';
    return this.execShellCommand(cmd);
  }

  execShellCommand(cmd) {
    return new Promise((resolve, reject) => {
      exec(cmd, (error, stdout, stderr) => {
        if (error) {
          throw new BadRequestException(error);
          console.warn(error);
        }
        resolve(stdout ? stdout : stderr);
      });
    });
  }
}
