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
  async getPlanPrueba(
    nombreDominio: string,
    nombreProblema: string,
  ): Promise<string> {
    let respuesta = '';
    await exec(
      'cd ../../../src/optic && ./optic-clp ' +
        ' ' +
        nombreDominio +
        '.pddl' +
        ' ' +
        nombreProblema +
        '.pddl',
      async function (error: any, stdout: string, stderr: any) {
        if (error) {
          throw new BadRequestException(error);
        } else {
          respuesta = stdout;
        }
      },
    );
    return respuesta;
  }
}
