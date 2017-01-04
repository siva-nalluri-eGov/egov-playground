/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 * accountability and the service delivery of the government  organizations.
 *
 *  Copyright (C) 2016  eGovernments Foundation
 *
 *  The updated version of eGov suite of products as by eGovernments Foundation
 *  is available at http://www.egovernments.org
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see http://www.gnu.org/licenses/ or
 *  http://www.gnu.org/licenses/gpl.html .
 *
 *  In addition to the terms of the GPL license to be adhered to in using this
 *  program, the following additional terms are to be complied with:
 *
 *      1) All versions of this program, verbatim or modified must carry this
 *         Legal Notice.
 *
 *      2) Any misrepresentation of the origin of the material is prohibited. It
 *         is required that all modified versions of this material be marked in
 *         reasonable ways as different from the original version.
 *
 *      3) This license does not grant any rights to any user of the program
 *         with regards to rights under trademark law for use of the trade names
 *         or trademarks of eGovernments Foundation.
 *
 *  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */

package org.egov.notification.rest.web.config;

import java.util.Properties;

import org.egov.notification.rest.web.config.properties.ApplicationProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ApplicationConfiguration {

	@Autowired
	private ApplicationProperties applicationProperties;

	@Bean
	public LocaleResolver localeResolver() {
		return new SessionLocaleResolver();
	}

	@Bean
	public JavaMailSenderImpl mailSender() {
		final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setPort(applicationProperties.mailPort());
		mailSender.setHost(applicationProperties.mailHost());
		mailSender.setProtocol(applicationProperties.mailProtocol());
		mailSender.setUsername(applicationProperties.mailSenderUsername());
		mailSender.setPassword(applicationProperties.mailSenderPassword());
		final Properties mailProperties = new Properties();
		mailProperties.setProperty("mail.smtps.auth", applicationProperties.mailSMTPSAuth());
		mailProperties.setProperty("mail.smtps.starttls.enable", applicationProperties.mailStartTLSEnabled());
		mailProperties.setProperty("mail.smtps.debug", applicationProperties.mailSMTPSDebug());
		mailSender.setJavaMailProperties(mailProperties);
		return mailSender;
	}

	@Bean
	public LocalValidatorFactoryBean entityValidator() {
		return new LocalValidatorFactoryBean();
	}

}
