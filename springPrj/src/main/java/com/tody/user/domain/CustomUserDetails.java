package com.tody.user.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
	
	private String ID;
	private String PASSWORD;
	private String AUTHORITY;
	private boolean ENABLED;
	private boolean CREDEXPI;
	private boolean LOCKED;
	private boolean NONEXPI;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(AUTHORITY));
		return auth;
	}

	@Override
	public String getPassword() {
		return PASSWORD;
	}

	@Override
	public String getUsername() {
		return ID;
	}

	@Override
	public boolean isAccountNonExpired() {
		return NONEXPI;
	}

	@Override
	public boolean isAccountNonLocked() {
		return LOCKED;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return CREDEXPI;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}

}
