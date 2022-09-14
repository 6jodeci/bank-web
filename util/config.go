package util

import (
	"time"

	"github.com/spf13/viper"
)

// Config stores all the configuration files of the apllication
// The values are read by viper from a config file or enviroment variables.
type Config struct {
	DBDriver            string        `mapstructure:"DB_DRIVER"`
	DBSourse            string        `mapstructure:"DB_SOURCE"`
	ServerAdress        string        `mapstructure:"SERVER_ADRESS"`
	TokenSymmetricKey   string        `mapstructure:"TOKEN_SYMMETRIC_KEY"`
	AccessTokenDuration time.Duration `mapstructure:"ACCESS_TOKEN_DURATION"`
}

// LoadConfig reads configuration from file or enviroment variables.
func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env") // can be json / xml / yaml ...

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}
	err = viper.Unmarshal(&config)
	return
}
