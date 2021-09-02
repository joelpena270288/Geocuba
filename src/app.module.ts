import { Configuration } from './config/config.key';
import { ConfigModule } from './config/config.module';
import { ConfigService } from './config/config.service';
import { HttpModule, Module } from '@nestjs/common';
import { PingController } from './modules/ping/ping.controller';
import { PingService } from './modules/ping/ping.service';
import { PostsService } from './modules/posts/posts.service';
import { PostsController } from './modules/posts/posts.controller';


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
