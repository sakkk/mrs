package mrs.app.reservation;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = { ThirtyMinutesUnitValidator.class })
@Retention(RUNTIME)
@Target({ FIELD, METHOD, PARAMETER, CONSTRUCTOR, ANNOTATION_TYPE })
public @interface ThirtyMinutesUnit {
	
	String message() default "{mrs.app.reservation.ThirtyMinutesUnit.messsage}";
	
	Class<?>[]groups() default {};
	
	Class<? extends Payload>[]payload() default {};
	
	@Documented
	@Retention(RUNTIME)
	@Target({ FIELD, METHOD, PARAMETER, CONSTRUCTOR, ANNOTATION_TYPE })
	public @interface List {
		ThirtyMinutesUnit[]value();
	}
}
