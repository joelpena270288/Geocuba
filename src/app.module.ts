import { Configuration } from './config/config.key';
import { ConfigModule } from './config/config.module';
import { ConfigService } from './config/config.service';
import { HttpModule, Module } from '@nestjs/common';
@Module({
  imports: [ConfigModule, HttpModule],
  controllers: [],
  providers: [ ],
})
export class AppModule {
  static port: number | string;
  constructor(private readonly _configService: ConfigService) {
    AppModule.port = this._configService.get(Configuration.PORT);
  }
}
