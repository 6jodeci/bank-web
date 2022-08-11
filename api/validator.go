package api

import (
	"bankapp/util"

	"github.com/go-playground/validator/v10"
)

var validCurrency validator.Func = func(fildLevel validator.FieldLevel) bool {
	if currency, ok := fildLevel.Field().Interface().(string); ok {
		return util.IsSupportedCurrency(currency)
	}
	return false
}
