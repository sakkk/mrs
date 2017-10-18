package mrs.app.reservation;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = { EndTimeMustBeAfterStartTimeValidator.class })
@Retention(RUNTIME)
@Target({ TYPE, ANNOTATION_TYPE })
public @interface EndTimeMustBeAfterStartTime {
	
	String message() default "{mrs.app.reservation.EndTimeMustBeAfterStartTime.message}";
	
	Class<?>[]groups() default {};
	
	Class<? extends Payload>[]payload() default {};
	
	@Documented
	@Retention(RUNTIME)
	@Target({ FIELD, METHOD, PARAMETER, CONSTRUCTOR, ANNOTATION_TYPE })
	public @interface List {
		EndTimeMustBeAfterStartTime[]value();
	}
}
