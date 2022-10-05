package validation

import (
	"fmt"
	"net/mail"
	"regexp"
)

var(
	isValidUsername = regexp.MustCompile(`^[a-z0-9_]+$`).MatchString
	isValidFullname = regexp.MustCompile(`^[a-zA-Z_\\s]+$`).MatchString
)

func ValidateString(value string, minLenght, maxLenght int) error {
	n := len(value)
	if n < minLenght || n > maxLenght {
		return fmt.Errorf("must contain from %d-%d characters", maxLenght, maxLenght)
	}
	return nil
}

func ValidateUsername(value string) error {
	if err := ValidateString(value, 3, 100); err != nil {
		return err
	}
	if !isValidUsername(value) {
		return fmt.Errorf("must contain only lowercase letters, digits or underscore")
	}
	return nil
}

func ValidateFullName(value string) error {
	if err := ValidateString(value, 2, 100); err != nil {
		return err
	}
	if !isValidFullname(value) {
		return fmt.Errorf("must contain only letters or spaces")
	}
	return nil
}

func ValidatePassword(value string) error {
	return ValidateString(value, 6, 100)
}

func ValidateEmail(value string) error {
	if err := ValidateString(value, 3, 200); err != nil {
		return err
	}
	if _, err := mail.ParseAddress(value); err != nil {
		return fmt.Errorf("is not a valid email address")
	}
	return nil
}