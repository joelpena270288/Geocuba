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
    let result;
    
    await exec("cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl problem.pddl", 
    async function(error: any, stdout: string, stderr: any){                                                                                    
          
    if(error){  
     
      console.log("ERROR!!!!!!", error);
   
    }else{                                                                                        
     
     await devolverCadena(stdout);
    }
  });

 
    
  }
 

}
export const  devolverCadena = async(stdout)=>{
  let salidacompleta: String[] = stdout.split("Cost:");
  let  salidaoptima: String[] = salidacompleta[1].split(":");
  let salida: String[] = salidacompleta[1].split("\n"); 
  return salida;
}